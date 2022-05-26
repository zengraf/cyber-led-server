class CyberLedController < ApplicationController
  def status
    render json: status
  end

  def power
    send 'power'
  end

  def brightness
    send 'brightness', params[:brightness].to_i
  end

  def temperature
    send 'temperature', params[:temperature].to_i
  end

  def mode
    send 'mode', params[:mode].to_i
  end

  private

  def status
    send 'status'
  end

  def send(command, argument=nil)
    serial.write "#{command}\n"
    serial.write "#{argument}\n" if argument.present?
  end

  def serial
    @serial ||= Serial.new ENV.fetch('ARDUINO_SERIAL_PORT') { '/dev/ttyUSB0' }
  end
end
