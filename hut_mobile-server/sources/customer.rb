require 'json'
require 'rest_client'

class Customer < SourceAdapter
  
  def initialize(source,credential)
     @base = 'http://dwork.local:3000/customers'
     super(source,credential)
   end
 
  def login
  end
 
  def query(params=nil)
    parsed=JSON.parse(RestClient.get("#{@base}.json").body)

    @result={}
    if parsed
      parsed.each do |item| 
        key = item["customer"]["id"].to_s
        @result[key]=item["customer"]
      end
    end
  end
 
  def sync
  end
 
  def create(create_hash,blob=nil)
    puts "Trying to create a Customer."
    result = RestClient.post(@base, :customer => create_hash)
    puts result.body.to_s
    location = "#{result.headers[:location]}.json"
    @customer = JSON.parse(RestClient.get(location).body)
    @customer["customer"]["id"].to_s
  end
 
  def update(update_hash)
  end
 
  def delete(delete_hash)
  end
 
  def logoff
  end
  
end