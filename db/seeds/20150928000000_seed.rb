Sequel.seed do # Applies only to "development" and "test" environments
  def run
    user = DB[:users]

    [
      ['John', 'Doe', 'john@doe.com', 'johndoe']
    ].each do |first_name, last_name, email, username|
      user.insert first_name: first_name, last_name: last_name, email: email, username: username
    end
  end
end
