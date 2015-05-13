describe "#google"  do
  context "with invalid credentials" do
    it "redirects to root_url" do
    end

    it "has flash alert" do
    end
  end
  
  context "with valid credentials" do
    it "creates user unless user exists" do
    end

    it "signs in a user" do
    end

    it "has a flash notice" do
    end
  end

  context ".from_twitter" do
    it "create a new user from oauth" do
    end
end