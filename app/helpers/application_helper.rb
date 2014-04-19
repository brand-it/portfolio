module ApplicationHelper
  
  def bootstrap_flash(custom_flash = {})
    my_flash = custom_flash.present? ? custom_flash : flash
    alert_types = [:error, :info, :success, :warning, :danger]
    flash_messages = []
    my_flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?
      
      type = :success if type == :notice
      type = :danger  if type == :alert
      type = :danger  if type == :error
      next unless alert_types.include?(type)
 
      Array(message).each do |msg|
        text = content_tag(:div,
        content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") +
        msg.html_safe, :class => "alert fade in alert-#{type}")
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end
  
  
end
