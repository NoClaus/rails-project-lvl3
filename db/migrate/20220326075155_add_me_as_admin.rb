class AddMeAsAdmin < ActiveRecord::Migration[6.1]
  def change
     User.find_or_create_by(email: 'ralko.stanislav@gmail.com').update(admin: true)
  end
end
