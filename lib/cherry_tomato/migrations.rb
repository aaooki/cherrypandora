module Panadoura
  def self.migrate
    ROMConfig.new.container.gateways[:default].tap do |gateway|
      migration = gateway.migration do
        change do
          create_table(:users) do
            primary_key :id
            String :username, null: false
            String :uid, null: false

            index :uid, unique: true
          end

          create_table(:entries) do
            primary_key :id
            Integer :length, null: false
            DateTime :created_at, null: false
            foreign_key :user_id, :users, null: false

            index :user_id
          end
        end
      end

      migration.apply gateway.connection, :up
    end
  end
end
