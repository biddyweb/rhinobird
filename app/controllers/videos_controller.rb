class VideosController < ApplicationController

	def index
		@videos = Video.find :all
	end

	def new

	end

	def search
		@videos = Video.find(:all,:conditions => ['title LIKE ?',"%"+params[:q]+"%"])
	end

	def create
		@video = Video.new(params[:video])
		@video.save
		params[:tags].split(',').each do |tag|
			tag = Tag.new({:video_id => @video.id,:name => tag})
			tag.save
		end
		redirect_to "/videos/"
	end

end
