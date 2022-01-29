class CatchMovies
    include HTTParty

    def execute
        @page = 1
        save_movies
    end
    
    private

    def save_movies
        url = "https://api.themoviedb.org/3/movie/popular?api_key=522ac90a6097129c9763ad9a542727aa&page=#{@page}"
        result = HTTParty.get(url).parsed_response
        result["results"].each do |movie|
            Movie.new(title: movie["original_title"]).save
            puts movie
            puts "\n"
        end
    end

    if @page < 100
        @page = @page+1
        save_movies
    end
end 