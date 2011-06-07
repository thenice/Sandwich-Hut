require 'json'
require 'rest_client'

class MenuItem < SourceAdapter
  def initialize(source,credential)
    @base = 'http://dwork.local:3000/menu_items'
    super(source,credential)
  end
 
  def login
  end
 
  def query(params=nil)
    parsed=JSON.parse(RestClient.get("#{@base}.json").body)

    @result={}
    if parsed
      parsed.each do |item| 
        key = item["menu_item"]["id"].to_s
        @result[key]=item["menu_item"]
      end
    end
  end
 
  def sync
    # Manipulate @result before it is saved, or save it 
    # yourself using the Rhosync::Store interface.
    # By default, super is called below which simply saves @result
    super
  end
 
  def create(create_hash,blob=nil)
    # TODO: Create a new record in your backend data source
    # If your rhodes rhom object contains image/binary data 
    # (has the image_uri attribute), then a blob will be provided
    raise "Please provide some code to create a single record in the backend data source using the create_hash"
  end
 
  def update(update_hash)
    # TODO: Update an existing record in your backend data source
    raise "Please provide some code to update a single record in the backend data source using the update_hash"
  end
 
  def delete(delete_hash)
    # TODO: write some code here if applicable
    # be sure to have a hash key and value for "object"
    # for now, we'll say that its OK to not have a delete operation
    # raise "Please provide some code to delete a single object in the backend application using the object_id"
  end
 
  def logoff
    # TODO: Logout from the data source if necessary
  end
end