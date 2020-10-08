class DumpsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def upload
    logger.info "PARAMS? ==>> #{params}"
    # 1. create a dump instance
    ts = Time.now.strftime("%Y%m%d%H%M%S")
    n = "#{params[:name]}_#{ts}"
    @dump = Dump.create!(name: n)

    # # 2. attach dump
    if @dump.valid?
      @dump.file.attach(params[:file])
      logger.info "new dump saved"
    else
      logger.fatal "FAILED TO CREATE NEW DUMP ==>> #{@dump.errors.full_messages}"
      render text: "failed"
    end
  end

  private

  def dump_params
    params.require(:dump).permit(:name, :file)
  end
end
