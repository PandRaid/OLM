namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(first_name: "admin",
                         last_name: "istrator",
                         school: "ASU",
                         email: "dcdunnin@asu.edu",
                         zip: "85284",
                         birth: "5",
                         username:"pandasrule",
                         password: "foobar777",
                         password_confirmation: "foobar777",
                         country: "USA",
                         admin: true)
        def user_params
      params.require(:user).permit(:first_name, :last_name, :school, :zip, :birth, :username, :email, :password, :password_confirmation, :country)
    end
  end
end