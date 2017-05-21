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

  test "POST /api/simple ok", %{conn: conn} do
    params = [resp_type: "ok"]
    conn = post conn, "/api/simple", params
    snippet(conn, format: :curl,
                  name: "Success",
                  qparams: params)
  end

  test "POST /api/simple unauthorized", %{conn: conn} do
    params = [resp_type: "unauthorized"]
    conn = post conn, "/api/simple", params
    snippet(conn, format: :curl,
                  name: "Unauthorized",
                  qparams: params)
  end

  test "POST /api/simple not_found", %{conn: conn} do
    params = [resp_type: "not_found"]
    conn = post conn, "/api/simple", params
    snippet(conn, format: :curl,
                  name: "NotFound",
                  qparams: params)
  end

  test "POST /api/simple bad_request", %{conn: conn} do
    params = [resp_type: "bad_request"]
    conn = post conn, "/api/simple", params
    snippet(conn, format: :curl,
                  name: "BadRequest",
                  qparams: params)
  end

end
