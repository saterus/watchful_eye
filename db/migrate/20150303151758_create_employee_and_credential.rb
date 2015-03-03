class CreateEmployeeAndCredential < ActiveRecord::Migration
  def change
    create_table(:employees) do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table(:credentials) do |t|
      t.string :email, null: false
      t.string :password_digest, null: false, default: ""
      t.datetime :confirmed_at
      t.references :employee

      t.timestamps
    end

    add_index :credentials, :email, unique: true
    add_index :credentials, :employee_id
  end
end
