Factory.define(:project) do |f|
  f.title "a cool project title"
  f.user { |a| a.association(:user) }
  f.short_description "short"
  f.description "a long dingy dingy"
end

Factory.define(:user) do |f|
  f.name "John Doe"
  f.user_name "johndoe"
  f.sequence(:email) { |n| "johndoe#{n}@example.com" }
  f.sequence(:identifier) { |n| "foobar#{n}" }
end
