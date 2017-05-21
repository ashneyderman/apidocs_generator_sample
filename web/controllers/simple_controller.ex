defmodule ApidocsGeneratorSample.SimpleController do
  use ApidocsGeneratorSample.Web, :controller

  @doc """
  Get method

  This method is here to examplify multi-line
  description. Just to annoy you slightly.

  @apiParam (Query Parameters) {String} dry_run Required parameter
  @apiParam (Query Parameters) {String} [zip] Optional parameter
  @apiVersion 2.0.1
  """
  def index(conn, params) do
    if Map.get(params, "dry_run") do
      conn
      |> put_status(:ok)
      |> json(%{ success: true })
    else
      conn
      |> put_status(:bad_request)
      |> json(%{ success: false,
                 message: "dry_run is a required parameter." })
    end
  end

  @doc """
  Post method

  @apiParam (Query Parameters) {String} resp_type Response type to produce
  """
  def post(conn, params) do
    resp_type = Map.get(params, "resp_type")
    if resp_type do
      case resp_type do
        "bad_request"    ->
          conn
          |> put_status(:bad_request)
          |> json(%{ success: false,
                     message: "bad_request." })
        "unauthorized" ->
          conn
          |> put_status(:unauthorized)
          |> json(%{ success: false,
                     message: "unauthorized." })
        "not_found" ->
          conn
          |> put_status(:not_found)
          |> json(%{ success: false,
                     message: "not_found." })
        "ok" ->
          conn
          |> put_status(:ok)
          |> json(%{ success: true })
      end
    else
      conn
      |> put_status(:bad_request)
      |> json(%{ success: false,
                 message: "resp_type is a required parameter." })
    end
  end

end
