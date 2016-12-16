module CherryPandora
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
        end
      end

      migration.apply gateway.connection, :up
    end
  end
end
