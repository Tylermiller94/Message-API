module Response
  def json_response(object, status = :ok)
    rensder json: object, status: status
  end
end
