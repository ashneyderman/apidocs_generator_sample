defmodule ApidocsGeneratorSample.SimpleControllerTest do
  use ApidocsGeneratorSample.ConnCase
  import Apidocs.SnippetsGenerator

  @endpoint ApidocsGeneratorSample.Endpoint

  test "GET /api/simple SUCCESS", %{conn: conn} do
    params = [dry_run: true]
    conn = get conn, "/api/simple", params
    snippet(conn, format: :curl,
                  name: "Success",
                  qparams: params)
  end
end
