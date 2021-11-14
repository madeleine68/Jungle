class Admin::SalesController < ApplicationController
    def index
        @sale = Sale.all
    end    
end
