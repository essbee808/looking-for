# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.where(email: "love.to.code.17@gmail.com").blank?
    User.create!(email: "love.to.code.17@gmail.com", password: "superadminpw", name: "SuperAdmin", admin: true)
end

User.create(name: "Test User", email: "testuser@gmail.com", password: "testuserpw")
User.create(name: "Meeko The Great", email: "meeko@gmail.com", password: "meekopw")


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
    organization: "CalAble", category_id: 1, creator_id: 1)
Program.create(name: "California Adult Education ", website: "https://caladulted.org/Home", 
    description: "This site is designed for administrators, educators, and prospective and current students. All users can find an adult school or community college in their area, learn about adult education programs and student supports, access program guidance and updates from the CAEP Office.", 
    organization: "California Department of Education", category_id: 2, creator_id: 1)
Program.create(name: "Volunteer Opportunities", website: "https://www.volunteermatch.org/", 
    description: "VolunteerMatch matches inspired people with inspiring causes. It's how volunteers and nonprofits connect to achieve remarkable outcomes.", 
    organization: "Volunteer Match", category_id: 3, creator_id: 1)
Program.create(name: "Housing Choice Voucher Program (Section 8)", website: "https://www.benefits.gov/benefit/710A", 
    description: "The California Section 8 (Housing Choice Voucher) Program is a federal government initiative that aims to help low-income families in the state to access affordable, safe and sanitary housing. This program is operated by the California Housing Authority (PHA) which has offices spread across the state. The California Public Housing Authority (PHA) receives funds directly from the U.S. Department of Housing and Urban Development (HUD), and uses these funds to administer the vouchers to beneficiaries of the program.", 
    organization: "The Housing Authority of the County of Los Angeles", category_id: 4, creator_id: 1)
Program.create(name: "CalFresh", website: "https://www.cdss.ca.gov/calfresh", 
    description: "CalFresh is for people with low-income who meet federal income eligibility rules and want to add to their budget to put healthy and nutritious food on the table.", 
    organization: "California Department of Social Services", category_id: 5, creator_id: 1)
Program.create(name: "Find the Right Therapist For You", website: "https://www.therapyden.com/", 
    description: "TherapyDen is a national platform for finding therapists. Search by insurance, specialty, location, and more. View full, detailed therapist profiles to help find the best fit for you.", 
    organization: "Therapy Den", category_id: 6, creator_id: 1)
Program.create(name: "Meet New People Who Share Your Interests", website: "https://www.meetup.com/", 
    description: "Meetup is a platform for finding and building local communities. People use Meetup to meet new people, learn new things, find support, get out of their comfort zones, and pursue their passions, together.", 
    organization: "Meetup", category_id: 7, creator_id: 1)
Program.create(name: "ACCESS", website: "https://accessla.org/", 
    description: "Access is a curb-to-curb shared-ride service.
    Several riders will be transported at one time in the same vehicle.
    It is not cab service, emergency medical or social service transportation, and is not door-to-door or a private transportation service.
    Access provides service within ¾ mile of fixed-route bus and rail line in Los Angeles County.
    Access operates on the same schedule as most buses. Regular service is offered from 4:00 AM to 12:00 AM, 7 days a week. Limited service is available from 12:00 AM to 4:00 AM.
    As a shared ride service your travel time will be similar to that of a fixed-route bus, not a car or taxi.
    Your one-way fare is based on the distance you travel with a maximum fare of $3.50 (except to/from and in Antelope and Santa Clarita Valleys).",
    organization: "Access Services", category_id: 8, creator_id: 2)
Program.create(name: "Lifeline - Utility Users Tax Exemption for Seniors and Individuals with Disabilities", website: "https://accessla.org/", 
    description: "The Utility User's Tax Exemption / Electric & Water Lifeline Rate Application Program was developed to offer senior and disabled citizens an exemption from their electric and other utility bills.  To qualify, you must be a user of utilities at a residential address within the City of Los Angeles and be responsible for the payment of utility bills under your name.",
    organization: "State of California", category_id: 1, creator_id: 2)
Program.create(name: "Scooter Rental", website: "https://scootaround.com/en/mobility-scooter-rentals", 
    description: "Scootaround is the nation’s leading personal transportation solutions company, offering rental, sales, and repair services for scooters, wheelchairs, powerchairs, and rollators at over 2,500 locations across North America and Europe.
    Customers can arrange worry-free rentals 7 days a week toll-free at 1-888-441-7575 or you can book online 24/7 at scootaround.com. Scootaround has developed a network of associates throughout North America to meet your most diverse travel needs, from conventions and business travel to vacations and cruises.",
    organization: "Scootaround", category_id: 8, creator_id: 2)
Program.create(name: "Free COVID-19 At Home Tests Available!", website: "https://picturegenetics.com/covid19/", 
    description: "If you're concerned about coronavirus symptoms or exposure, Picture offers a simple diagnostic test you can take from home.

    Reduce your risk of exposure at the doctor's office and know that your results will be fast and reliable.",
    organization: "Fulgent Genetics", category_id: 5, creator_id: 2)

    