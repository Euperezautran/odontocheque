class ChequesController < ApplicationController
  def cheque
    @user = current_user
      respond_to do |format|
        format.html
        format.pdf do
          pdf = render_to_string(pdf: "cheques/cheque.pdf.erb", template: "cheques/cheque.pdf.erb", layout: "pdf.html", background: true)
          send_data pdf, filename: 'report.pdf', type: 'application/pdf'
        end
      end
    end

    def numero_de_cheque
    end
  end
