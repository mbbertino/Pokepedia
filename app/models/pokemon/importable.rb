module Pokemon::Importable
  extend ActiveSupport::Concern

  included do
    def self.import_from_csv
      records = []

      CSV.read(
        Rails.root.join('db', 'pokemon_csvs', self::IMPORTING_FILE_NAME),
        headers: true
      ).each do |row|
        records << {}.tap do |record|
          self::IMPORTING_MAP.each { |header, column| record[column.to_sym] = row[header] }
        end
      end

      upsert_all(records, unique_by: :id)
    end
  end
end
