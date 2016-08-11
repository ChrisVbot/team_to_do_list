class AddTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.timestamps
    end
    create_table :teams do |t|
      t.string :name
      t.timestamps
    end
    
    create_table :pairings do |t|
      t.belongs_to :user
      t.belongs_to :team
      t.timestamps
    end

    create_table :lists do |t|
      t.references :team, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title
      t.timestamps
      t.boolean :complete
      t.boolean :priority
    end
    create_table :tasks do|t|
      t.references :list, foreign_key: true
      t.string :content
      t.timestamps
    end
  end
end

