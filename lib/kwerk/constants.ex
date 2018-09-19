defmodule Kwerk.Constants do
  # STATUS DEFINITIONS
  def cSTATUS_ACTIVE, do: "active"
  def cSTATUS_INACTIVE, do: "inactive"
  def cSTATUS_DELETED, do: "deleted"
  def cSTATUS_PENDING, do: "pending"
  def cSTATUS_DRAFT, do: "draft"

  # ROLE DEFINITIONS
  def cUSER_ROLE_ADMIN, do: "admin"
  def cUSER_ROLE_USER, do: "user"
end
