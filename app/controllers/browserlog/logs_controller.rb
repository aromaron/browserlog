module Browserlog
  class LogsController < ApplicationController
    before_action :check_env
    before_action :check_auth

    layout 'browserlog/application'

    def index
      @filename = "#{Rails.env}.log"
      @filepath = Rails.root.join("log/#{@filename}")
    end

    def changes
      lines, last_line_number = reader.read(offset: params[:currentLine].to_i, log_file_name: Rails.env.to_s)

      respond_to do |format|
        format.json do
          render json: {
            lines: lines.map! { |line| colorizer.colorize_line(line) },
            last_line_number: last_line_number
          }
        end
      end
    end

    private

    def reader
      Browserlog::LogReader.new
    end

    def colorizer
      Browserlog::LogColorize.new
    end

    def check_env
      raise unless Browserlog.config.allowed_log_files.include?(Rails.env.to_s)
    end

    def check_auth
      raise 'Logs not allowed on production environment.' if Rails.env.production? && !Browserlog.config.allow_production_logs
    end
  end
end
