context "with valid credentials" do 
  before do
    OmniAuth.config.add_mock(:google, { uid: '12345'})
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google]
  end

  it "creates user unless user exists" do 
    expect { get :google }.to change(User, :count).by(1)
  end
end