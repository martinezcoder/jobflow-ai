require "rails_helper"

RSpec.describe "User sign in", type: :request do
  describe "GET /users/sign_in" do
    it "shows the sign-in form" do
      get new_user_session_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Sign in")
    end
  end

  describe "POST /users/sign_in" do
    let!(:user) { create(:user, email: "returning@example.com", password: "password123") }

    context "with valid credentials" do
      it "signs the user in and redirects to the home page" do
        post user_session_path, params: {
          user: {
            email: "returning@example.com",
            password: "password123"
          }
        }

        expect(response).to redirect_to(root_path)
        follow_redirect!
        expect(response.body).to include("Signed in as returning@example.com")
      end
    end

    context "with invalid credentials" do
      it "displays a clear error" do
        post user_session_path, params: {
          user: {
            email: "returning@example.com",
            password: "wrong-password"
          }
        }

        expect(response).to have_http_status(:unprocessable_content)
        expect(response.body).to include("Invalid email or password.")
      end
    end
  end
end

RSpec.describe "Protected pages", type: :request do
  it "redirects unauthenticated visitors to sign in" do
    get root_path

    expect(response).to redirect_to(new_user_session_path)
  end

  it "allows authenticated users to access the home page" do
    user = create(:user)
    sign_in user

    get root_path

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Welcome to JobFlow AI")
  end
end
