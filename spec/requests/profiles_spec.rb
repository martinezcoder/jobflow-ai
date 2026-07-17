require "rails_helper"

RSpec.describe "Profiles", type: :request do
  describe "authentication" do
    it "redirects unauthenticated visitors away from the profile page" do
      get profile_path

      expect(response).to redirect_to(new_user_session_path)
    end

    it "redirects unauthenticated visitors away from the edit profile page" do
      get edit_profile_path

      expect(response).to redirect_to(new_user_session_path)
    end

    it "redirects unauthenticated visitors away from profile updates" do
      patch profile_path, params: {
        user: { first_name: "Ada", last_name: "Lovelace" }
      }

      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "GET /profile" do
    it "shows the current user's profile" do
      user = create(:user, first_name: "Grace", last_name: "Hopper", email: "grace@example.com")
      sign_in user

      get profile_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Profile")
      expect(response.body).to include("Grace")
      expect(response.body).to include("Hopper")
      expect(response.body).to include("grace@example.com")
    end
  end

  describe "GET /profile/edit" do
    it "shows the edit form for the current user" do
      user = create(:user, first_name: "Grace", last_name: "Hopper")
      sign_in user

      get edit_profile_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Edit profile")
      expect(response.body).to include("Grace")
      expect(response.body).to include("Hopper")
    end
  end

  describe "PATCH /profile" do
    context "with valid attributes" do
      it "updates the profile and shows a confirmation message" do
        user = create(:user, first_name: "Grace", last_name: "Hopper")
        sign_in user

        patch profile_path, params: {
          user: { first_name: "Ada", last_name: "Lovelace" }
        }

        expect(response).to redirect_to(profile_path)
        follow_redirect!
        expect(response.body).to include("Profile updated successfully.")
        expect(response.body).to include("Ada")
        expect(response.body).to include("Lovelace")
        expect(user.reload).to have_attributes(first_name: "Ada", last_name: "Lovelace")
      end
    end

    context "with invalid attributes" do
      it "displays validation errors" do
        user = create(:user, first_name: "Grace", last_name: "Hopper")
        sign_in user

        patch profile_path, params: {
          user: { first_name: "A" * 101, last_name: "Hopper" }
        }

        expect(response).to have_http_status(:unprocessable_content)
        expect(response.body).to include("error_explanation")
        expect(response.body).to include("First name")
        expect(user.reload.first_name).to eq("Grace")
      end
    end
  end

  describe "protection against accessing another user's profile" do
    it "always scopes the profile to the authenticated user" do
      user = create(:user, first_name: "Grace", last_name: "Hopper", email: "grace@example.com")
      create(:user, first_name: "Alan", last_name: "Turing", email: "alan@example.com")
      sign_in user

      get profile_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Grace")
      expect(response.body).to include("Hopper")
      expect(response.body).to include("grace@example.com")
      expect(response.body).not_to include("Alan")
      expect(response.body).not_to include("Turing")
      expect(response.body).not_to include("alan@example.com")
    end

    it "does not expose a profile route keyed by another user's id" do
      user = create(:user)
      other_user = create(:user)
      sign_in user

      get "/profiles/#{other_user.id}"

      expect(response).to have_http_status(:not_found)
    end

    it "updates only the authenticated user's profile" do
      user = create(:user, first_name: "Grace", last_name: "Hopper")
      other_user = create(:user, first_name: "Alan", last_name: "Turing")
      sign_in user

      patch profile_path, params: {
        user: { first_name: "Changed", last_name: "Name" }
      }

      expect(user.reload).to have_attributes(first_name: "Changed", last_name: "Name")
      expect(other_user.reload).to have_attributes(first_name: "Alan", last_name: "Turing")
    end
  end
end
