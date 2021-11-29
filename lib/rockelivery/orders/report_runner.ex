defmodule Rockelivery.Orders.ReportRunner do
  use GenServer
  require Logger

  alias Rockelivery.Orders.Report
  # CLIENT
  def start_link(_initial_stack) do
    GenServer.start_link(__MODULE__, %{})
  end

  # SERVER
  @impl true
  def init(state) do
    Logger.info("ReportRunner started at #{DateTime.utc_now()}", ansi_color: :yellow)
    schedule_report_generation()
    {:ok, state}
  end

  @impl true
  def handle_info(_message, state) do
    Logger.info("[#{Date.utc_today()}] - Generating report ...", ansi_color: :yellow)

    "priv/reports/#{Date.utc_today()} - report.csv"
    |> Report.create()

    schedule_report_generation()
    {:noreply, state}
  end

  def schedule_report_generation do
    Process.send_after(self(), :generate, 1000 * 10)
  end
end
