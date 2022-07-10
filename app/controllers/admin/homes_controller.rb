class Admin::HomesController < ApplicationController
  def top
    @orders=Order.page(params[:page]).per(10)
    #ページャ導入により.allから書き換え
    #.per10は要検証
  end
end
