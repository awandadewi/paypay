namespace :db do
  desc "Seed fake demo data"
  task demo: :environment do

    Rake::Task['db:seed'].invoke

    # Create company
    company = Company.find_or_create_by(name: "First Company")

    # Create user
    admin = User.find_or_create_by(name: "Willy", email: "willy@gmail.com")
    admin.password = "123456"
    admin.password_confirmation = "123456"
    admin.save

    user = User.find_or_create_by(name: "Eky", email: "eky@gmail.com")
    user.password = "123456"
    user.password_confirmation = "123456"
    user.save

    # Create membership
    Membership.create(company: company, user: admin, role: "admin")
    Membership.create(company: company, user: user, role: "employee")

  end
end
