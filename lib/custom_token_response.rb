
module CustomTokenResponse
  def body
    {
        code: 0,
        message: 'success',
        data: {token: super}
    }
  end
end