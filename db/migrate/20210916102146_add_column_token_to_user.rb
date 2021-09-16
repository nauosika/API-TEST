class AddColumnTokenToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :authentication_token, :string
    # 加索引與要求unique
    add_index :users, :authentication_token, :unique => true

    #如果DB已經有其他user在，請多做這一步。
    # User.find_each do |user|
    #   user.generate_authentication_token
    #   user.save!
    # end
  end
end
