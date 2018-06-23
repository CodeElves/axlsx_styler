require 'active_support/core_ext/hash/deep_merge'

module AxlsxStyler
  module Axlsx
    module Cell
      attr_accessor :raw_style

      def add_style(style)
        self.raw_style ||= {}
        add_to_raw_style(style)
        workbook.add_styled_cell self
      end

      private

      def workbook
        row.worksheet.workbook
      end

      def add_to_raw_style(style)
        new_style = raw_style.deep_merge style

        self.raw_style = new_style
      end
    end
  end
end
