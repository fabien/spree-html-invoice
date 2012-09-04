module Spree
  module Admin
    class InvoiceController < Spree::Admin::BaseController
      
      prepend_before_filter :load_order
      
      def show
        template = params[:template]
        eval "@#{template} = true"
        render template , :layout => false
      end
      
      protected
      
      # for compatibility with spree_currency
      def currency_model?
        true
      end
      
      def currency_model
        @order
      end
      
      private
      
      def load_order
        @order = Order.find_by_number!(params[:id], :include => :adjustments) if params[:id]
      end
            
    end
  end
end
