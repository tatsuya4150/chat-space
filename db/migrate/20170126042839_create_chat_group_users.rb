class CreateChatGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_group_users do |t|
      t.references :user
      t.references :chat_group

      t.timestamps
    end
  end
end
