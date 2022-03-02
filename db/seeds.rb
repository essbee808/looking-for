# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.where(email: "love.to.code.17@gmail.com").blank?
    User.create!(email: "love.to.code.17@gmail.com", password: "superpassword", name: "SuperAdmin", admin: true)
end

Category.create(name: "Money")
Category.create(name: "Education")
Category.create(name: "Work")
Category.create(name: "Housing")
Category.create(name: "Health")
Category.create(name: "Food")
Category.create(name: "Social")
Category.create(name: "Transit")

Program.create(name: "CalABLE Account", website: "https://www.cdss.ca.gov/benefits-services/more-services/calable", 
    description: "An ABLE Account is a tax-advantaged savings account that allows individuals with disabilities to save and invest money for disability-related expenses (called Qualified Disability Expenses, or QDEs) without losing eligibility for certain means-tested public benefits programs, such as Medicaid, Supplemental Nutrition Assistance Program (SNAP), Supplemental Security Income (SSI) or Social Security Disability Insurance (SSDI).", 
    category_id: 1, creator_id: 1)
Program.create(name: "California Adult Education ", website: "https://caladulted.org/Home", 
    description: "This site is designed for administrators, educators, and prospective and current students. All users can find an adult school or community college in their area, learn about adult education programs and student supports, access program guidance and updates from the CAEP Office.", 
    category_id: 2, creator_id: 1)
Program.create(name: "Volunteer Match", website: "https://www.volunteermatch.org/", 
    description: "VolunteerMatch matches inspired people with inspiring causes. It's how volunteers and nonprofits connect to achieve remarkable outcomes.", 
    category_id: 3, creator_id: 1)
Program.create(name: "Section 8 Housing", website: "https://www.sectioneightapplication.com/apply/CA", 
    description: "The California Section 8 (Housing Choice Voucher) Program is a federal government initiative that aims to help low-income families in the state to access affordable, safe and sanitary housing. This program is operated by the California Housing Authority (PHA) which has offices spread across the state. The California Public Housing Authority (PHA) receives funds directly from the U.S. Department of Housing and Urban Development (HUD), and uses these funds to administer the vouchers to beneficiaries of the program.", 
    category_id: 4, creator_id: 1)
Program.create(name: "CalFresh", website: "https://www.cdss.ca.gov/calfresh", 
    description: "CalFresh is for people with low-income who meet federal income eligibility rules and want to add to their budget to put healthy and nutritious food on the table.", 
    category_id: 5, creator_id: 1)
Program.create(name: "Therapy Den", website: "https://www.therapyden.com/", 
        description: "TherapyDen is a national platform for finding therapists. Search by insurance, specialty, location, and more. View full, detailed therapist profiles to help find the best fit for you.", 
        category_id: 6, creator_id: 1)
Program.create(name: "Meetup", website: "https://www.meetup.com//", 
    description: "
    Meetup is a platform for finding and building local communities. People use Meetup to meet new people, learn new things, find support, get out of their comfort zones, and pursue their passions, together.", 
    category_id: 7, creator_id: 1)
Program.create(name: "ACCESS", website: "https://accessla.org/", 
    description: "provides transportation services for people who have disabilities and are unable to use regular public bus and train service.",
    category_id: 8, creator_id: 1)