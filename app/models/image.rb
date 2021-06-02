class Image < ApplicationController
    mount_uploader :picture, PictureUploader
end