class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table(:users) do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""
      t.boolean :allow_password_change

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email

      ## User Info
      t.string  :first_name
      t.string  :last_name
      t.string  :email
      t.string  :company
      t.string  :gender
      t.string  :profile_picture
      t.boolean :host, :null => false, :default => false
      t.boolean :allow_other_companies, :null => false, :default => false
      t.text    :place
      t.text    :about_me
      t.text    :why_involved
      t.float   :latitude
      t.float   :longitude
      t.boolean :ambassador
      t.string  :spoken_languages
      t.boolean :verified
      t.text    :social_networks

      ## Tokens
      t.json :tokens

      ## Act as Paranoid
      t.timestamp :deleted_at

      t.timestamps
    end

    add_index :users, :email
    add_index :users, %i[uid provider], unique: true
    add_index :users, :host
    add_index :users, :allow_other_companies
    add_index :users, :reset_password_token, unique: true
    add_index :users, :deleted_at
  end
end
