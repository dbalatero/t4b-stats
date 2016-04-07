require 'ostruct'

class StatBoxStencil < Stencil::Base
  include ActionView::Helpers::NumberHelper

  template "stat_box"
  needs :title, :stats

  attr_reader :title, :stats

  def progress_bars
    return [] if total.zero?

    [
      progress_bar(
        'Waiting on admins',
        waiting_on_admins,
        'alert',
        "These assignments are either waiting on admins to upload or to fix some issues "\
          "with data."
      ),
      progress_bar(
        'Ready for work',
        ready_for_hustling,
        'warning',
        "These assignments are in Hustlers' phones, and are ready to work on."
      ),
      progress_bar(
        'Almost completed',
        almost_completed,
        'primary',
        "These assignments are ~95% complete, but waiting on a few Hustlers to finish."
      ),
      progress_bar(
        'Completed',
        completed,
        'success',
        "These assignments are 100% completed!"
      ),
    ]
  end

  def waiting_on_admins
    prepping + stuck + ready_for_upload
  end

  def prepping
    stats['prepping'].to_i
  end

  def stuck
    stats['stuck'].to_i
  end

  def ready_for_upload
    stats['ready_for_upload'].to_i
  end

  def ready_for_hustling
    stats['ready_for_hustling'].to_i
  end

  def almost_completed
    stats['almost_completed'].to_i
  end

  def completed
    stats['completed'].to_i
  end

  def canceled
    stats['canceled'].to_i
  end

  def total
    stats['total_supporters'].to_i - canceled
  end

  private

  def progress_bar(name, count, css_class = nil, tooltip = nil)
    percentage = (count.to_f / total.to_f * 100).round(2)
    percentage = 0 if percentage == 0.0

    OpenStruct.new \
      name: name,
      percentage: percentage,
      count: count,
      css_class: css_class,
      tooltip: tooltip
  end
end
