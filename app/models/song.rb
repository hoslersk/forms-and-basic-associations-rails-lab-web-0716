class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name if self.genre
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def note_contents=(notes)
    #binding.pry
    notes.each do |content|
      if content != ''
        self.notes.build(content: content)
      end
    end
    # self.note = Note.find_or_create_by(contents: note_contents)
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end

end
