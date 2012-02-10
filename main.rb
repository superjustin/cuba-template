require "cuba"

Dir[File.dirname(__FILE__) + "/app/models/*.rb"].each do |file|
  require file
end

Cuba.define do
  on get do
    on "" do
      res.write render("app/views/layouts/main.erb") {
        render("app/views/hello.erb")
      }
    end

    on "hello" do
      res.write render("app/views/layouts/main.erb") {
        render("app/views/hello.erb")
      }
    end

    on "not_found" do
      res.write render("app/views/layouts/main.erb") {
        render("app/views/not_found.erb")
      }
    end

    on "widget" do
      res.write Widget.get
    end

    on true do
      res.redirect "/not_found"
    end
  end
end
