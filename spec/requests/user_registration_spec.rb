require "rails_helper"

RSpec.describe "User registration", type: :request do
  describe "GET /users/sign_up" do
    it "shows the registration form" do
      get new_user_registration_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Sign up")
    end
  end

  describe "POST /users" do
    context "with valid credentials" do
      it "creates the user, signs them in, and redirects to the home page" do
        post user_registration_path, params: {
          user: {
            email: "newuser@example.com",
            password: "password123",
            password_confirmation: "password123"
          }
        }

        expect(response).to redirect_to(root_path)
        follow_redirect!
        expect(response.body).to include("Signed in as newuser@example.com")
        expect(User.find_by(email: "newuser@example.com")).to be_present
      end
    end

    context "with invalid credentials" do
      it "displays validation errors" do
        post user_registration_path, params: {
          user: {
            email: "",
            password: "short",
            password_confirmation: "different"
          }
        }

        expect(response).to have_http_status(:unprocessable_content)
        expect(response.body).to include("error_explanation")
        expect(response.body).to include("Email")
      end
    end
  end
end

RSpec.describe "User sign out", type: :request do
  it "signs the user out" do
    user = create(:user)
    sign_in user

    delete destroy_user_session_path

    expect(response).to redirect_to(root_path)
    follow_redirect!
    expect(response).to redirect_to(new_user_session_path)
    follow_redirect!
    expect(response.body).to include("Sign in")
    expect(response.body).to include("Sign up")
    expect(response.body).not_to include("Signed in as")
  end
end
