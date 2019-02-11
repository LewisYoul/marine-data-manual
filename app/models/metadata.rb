class Metadata < ApplicationRecord

  def self.filters_to_json
    metadata = Metadata.all
    unique_categories = metadata.pluck(:category).compact.uniq.sort

    filters = [
      {
        name: "category",
        title: "Category",
        options: unique_categories,
        sortButtons: true
      },
      {
        name: "resource",
        title: "Resource",
        sortButtons: true
      },
      {
        name: "version",
        title: "Version",
        sortButtons: true
      },
      {
        name: "contact_organisation",
        title: "Contact Organisation",
        sortButtons: true
      },
      {
        name: "id",
        title: "ID",
        sortButtons: true
      },
      {
        name: "metadata",
        title: "Metadata",
        options: ["Metadata", "No Metadata"],
        sortButtons: false,
        type: "boolean"
      },
      {
        name: "factsheet",
        title: "Factsheet",
        options: ["Factsheet", "No Factsheet"],
        sortButtons: false,
        type: "boolean"
      },
      {
        name: "themes",
        title: "Themes",
        options: ["Marine spatial planning", "Education", "Ecosystem assessment", "Environmental impact assessment", "Ecosystem services"],
        sortButtons: false,
        type: "multiple"
      },
    ].to_json
  end

  def self.table_headers_to_json
    table_headers = [
      {
        name: "category",
        title: "Category",
        sortButtons: true,
        onMobile: false
      },
      {
        name: "resource",
        title: "Resource",
        sortButtons: true,
        onMobile: true
      },
      {
        name: "contact_organisation",
        title: "Contact Organisation",
        sortButtons: true,
        onMobile: false
      },
      {
        name: "themes",
        title: "Themes",
        sortButtons: false,
        onMobile: false
      }
    ].to_json
  end

  def self.metadata
    output = []
    metadata = Metadata.all.order(id: :asc)
    metadata.to_a.each do |meta|
      meta_attributes = meta.attributes
      meta_attributes[:metadata] = metadata_url(meta)
      meta_attributes[:themes] = []
      ["marine_spatial_planning", "education", "environmental_impact_assessment",
      "ecosystem_assessment", "ecosystem_services"].each do |attribute|
        meta_attributes[:themes] << attribute.capitalize.gsub('_', ' ') if meta_attributes[attribute]
        meta_attributes.delete(attribute)
      end
      meta_attributes.delete_if { |k, v| ["created_at", "updated_at"].include? k }
      output << meta_attributes
    end
    output
  end

  def self.to_csv
    csv = ''
    metadata_columns = Metadata.new.attributes.keys
    metadata_columns.delete_if { |k, v| ["created_at", "updated_at"].include? k }

    metadata_columns.map! { |e|
      e.gsub("_", " ").capitalize
    }

    csv << metadata_columns.join(',')
    csv << "\n"

    metadata = Metadata.order(id: :asc)

    metadata.to_a.each do |meta|
      metadata_attributes = meta.attributes
      metadata_attributes.delete_if { |k, v| ["created_at", "updated_at"].include? k }

      metadata_attributes = metadata_attributes.values.map{ |e| "\"#{e}\"" }
      csv << metadata_attributes.join(',').to_s
      csv << "\n"
    end

    csv

  end

  private

  def self.metadata_url(meta)
    meta.metadata ? pdf_download_link : nil
  end

  def self.pdf_download_link
    "http://wcmc.io/metadata"
  end

end
