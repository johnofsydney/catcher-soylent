class SoyBoyController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    @document = Document.find_by(token: document_params[:token])

    if @document.present?
      respond_to do |format|
        if @document.update(link: document_params[:link])
          format.html { redirect_to document_url(@document), notice: "Document was successfully updated." }
          format.json { render :show, status: :ok, location: @document }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @document.errors, status: :unprocessable_entity }
        end
      end
    else
      @document = Document.new(document_params)

      respond_to do |format|
        if @document.save
          format.html { redirect_to document_url(@document), notice: "Document was successfully created ." }
          format.json { render :show, status: :ok, location: @document }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @document.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def document_params
      params.except(:soy_boy).permit(:description, :link, :key, :token)
    end
end
