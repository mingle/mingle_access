require '../mingle_access'

access = MingleAccess::BasicAuth.new("http://mingle.example.com:8080", "djrice", "p")
puts access.fetch_page("/api/v2/projects.xml")