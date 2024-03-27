class CreateOrganizations < ActiveRecord::Migration[7.1]
  def change
    create_table :organizations do |t|

      t.timestamps
    end
  end
end
