defmodule Wedding.RsvpControllerTest do
  use Wedding.ConnCase

  alias Wedding.Rsvp
  @valid_attrs %{first_name: "some content", last_name: "some content", luncheon: true, sealing: true}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, rsvp_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing rsvps"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, rsvp_path(conn, :new)
    assert html_response(conn, 200) =~ "New rsvp"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, rsvp_path(conn, :create), rsvp: @valid_attrs
    assert redirected_to(conn) == rsvp_path(conn, :index)
    assert Repo.get_by(Rsvp, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, rsvp_path(conn, :create), rsvp: @invalid_attrs
    assert html_response(conn, 200) =~ "New rsvp"
  end

  test "shows chosen resource", %{conn: conn} do
    rsvp = Repo.insert! %Rsvp{}
    conn = get conn, rsvp_path(conn, :show, rsvp)
    assert html_response(conn, 200) =~ "Show rsvp"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, rsvp_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    rsvp = Repo.insert! %Rsvp{}
    conn = get conn, rsvp_path(conn, :edit, rsvp)
    assert html_response(conn, 200) =~ "Edit rsvp"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    rsvp = Repo.insert! %Rsvp{}
    conn = put conn, rsvp_path(conn, :update, rsvp), rsvp: @valid_attrs
    assert redirected_to(conn) == rsvp_path(conn, :show, rsvp)
    assert Repo.get_by(Rsvp, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    rsvp = Repo.insert! %Rsvp{}
    conn = put conn, rsvp_path(conn, :update, rsvp), rsvp: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit rsvp"
  end

  test "deletes chosen resource", %{conn: conn} do
    rsvp = Repo.insert! %Rsvp{}
    conn = delete conn, rsvp_path(conn, :delete, rsvp)
    assert redirected_to(conn) == rsvp_path(conn, :index)
    refute Repo.get(Rsvp, rsvp.id)
  end
end
