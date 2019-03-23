class StrongService
  def self.populate
    strongs.each do |strong|
      Strong.create! strong_number: strong[:strong_number],
                     meaning:       strong[:meaning],
                     greek:         strong[:greek],
                     translit:      strong[:translit],
                     morphology:    strong[:morphology],
                     description:   strong[:description]
    end
    nil
  end

  def self.txt
    File.join Rails.root, "datasets", "tbesg.tsv"
  end

  def self.strongs
    headers = [:strong_number, :meaning, :greek, :translit, :morphology, :description]
    SmarterCSV.process txt,
      col_sep: "\t",
      quote_char: "|",
      user_provided_headers: headers,
      headers_in_file: false,
      skip_lines: 1,
      verbose: true
  end

  def self.normalize_strongs
    Strong.find_each do |strong|
      strong.update_attribute(:normalized_greek, WordService.normalize(strong.greek))
    end
  end
end
