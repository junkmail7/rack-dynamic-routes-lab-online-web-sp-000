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
      if item == nil
        resp.status = 400
        resp.write "Route not found"
      else
        resp.write item.price
      end
    else
      resp.status = 400
      resp.write "Route not found"
    end
    resp.finish
  end
end
