class ImportFile
  def initialize(file)
    @file = file
    @flag = true
  end

  def run
    spreadsheet = open_spreadsheet
    error_message = "You're allowed to upload excel document only"
    
    if @flag
      header = spreadsheet.row(1)

      @flag = header == ["Product Name", "Brand", "Principal", "Minimum order quantity (MOQ)", "UOM", "Leadtime (working days)", "Country of Orign", "Certification", "Category", "Sub Category"]
      unless @flag
        error_message = "Upload failed. File is not match catalog template"
      end
    end

    return @flag, error_message
  end

  def open_spreadsheet
    case File.extname(@file.original_filename)
    when '.csv' then Roo::Csv.new(@file.path)
    when '.xls' then Roo::Excel.new(@file.path)
    when '.xlsx' then Roo::Excelx.new(@file.path)
    else @flag = false
    end
  end
end