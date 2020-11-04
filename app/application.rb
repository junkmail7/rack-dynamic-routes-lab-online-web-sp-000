class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find do |i|
        i.name == item_name
      end
      resp.write item.price
    else
      resp.write "404"
    end
    resp.finish
  end
end
