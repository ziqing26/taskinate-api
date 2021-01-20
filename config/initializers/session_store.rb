if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, key: "_taskinate-app", domain: "taskinate-app.herokuapp.com"
else
    Rails.application.config.session_store :cookie_store, key:   "_taskinate-app"
end