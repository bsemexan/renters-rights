# frozen_string_literal: true

require 'faraday'
require 'pp'
require 'nokogiri'

class RentersRightsController < ApplicationController
  layout "renters_rights"

  def index
  end

  def renters_post
    if params[:city].strip.upcase == "SAN JOSE"
      redirect_to '/renters-reasons'
    else
      redirect_to '/not-applicable'
    end
  end

  def not_applicable
  end

  def help_type
  end

  def help_type_post
    if params[:evict] == "on"
      redirect_to '/renters-reasons'
    else
      redirect_to '/not-applicable'
    end
  end

  def renters_reasons
  end

  def renters_reasons_post
    if params[:gavereason] == "yes" && params[:ownermovein] == "on" || params[:ellisact] == "on" || params[:ordertovacate] == "on" || params[:leavingunpermittedunit] == "on" || params[:rehabilitation] == "on"
      redirect_to '/tenant-relocation'
    elsif params[:gavereason] == "yes" && params[:nonpayment] == "on" ||  params[:lease] == "on" || params[:damage] == "on" || params[:refulsalnew] == "on" || params[:nuisance] == "on" || params[:refusing] == "on" || params[:sublease] == "on"
      redirect_to '/eviction-resources'
    elsif params[:gavereason] == "no"
      redirect_to '/tpo'
    end 
  end
  
  def tenant_relocation
  end

  def eviction_resources
  end

  def tpo_message
  end 

  def resources
  end 

  def tax_rate_area_get
    conn = Faraday.new do |c|
      c.use FaradayMiddleware::FollowRedirects
      c.adapter Faraday.default_adapter
    end
    response = conn.get('https://www.sccassessor.org/apps/SearchResult.aspx', {
      SFrom: 'rp',
      SType: 'rp',
      STab: 'address',
      addValue: '2920 HUFF AV SAN JOSE'
    })

    # parse this html...
    File.binwrite('/tmp/result.html', response.body)
  end 

  def tax_rate_area_parse
    html = File.binread('/tmp/result.html')
    doc = Nokogiri::HTML(html)
    tax_rate_div = doc.at_xpath('//*[@id="tab-5"]//*[contains(text(), "TAX RATE AREA INFORMATION")]') 
    pp tax_rate_div.text
  end 

  private

  def path_to_asset(asset)
    ApplicationController.helpers.asset_path(asset)
  end

end
