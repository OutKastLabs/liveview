defmodule Reactor.Coordinate do
  defstruct in_island: :none, guessed?: false
  alias __MODULE__

# Elixir Agents abstract away the complexities of managing state with Elixir processes. We won’t need to write our own recursive functions that query the mailbox for new messages. The whole reason Agents exist is to hold state and allow us to query and manipulate it.
# Agents are the simplest way to use OTP in Elixir. OTP stands for Open Telecom Platform. It’s the Erlang super-library/design pattern combination that makes Elixir and Erlang’s incredible concurrency, fault tolerance, and distribution possible.
# Elixir abstracts away almost all of the OTP patterns when we use an agent. Under the hood, though, OTP is there. As we move through the next few chapters, we’ll gradually see more and more of the inner workings of OTP. For now, agents will give us the gentlest possible introduction.
# The Agent module itself provides a few simple functions that allow us to start a new process as well as access and update the agent’s state
# In order to build an agent, we’ll begin with a plain Elixir module. To add new behavior, we’ll define public functions that wrap Agent module functions. For each agent we build, we’ll have one public function that will start a new agent process with some initial state.
# We can write other public functions to query the agent’s state and return responses to the caller. Public functions can transform the agent’s state as well.
# All the public functions will take a PID as their first argument. This provides an address to send the messages to.
  def start_link() do
    Agent.start_link(fn -> %Coordinate{} end)
  end

  # The two most basic things we should be able to do are get the state and update it.
  # The Agent module includes functions for both, Agent.get and Agent.update.
  # Each comes in either a three arity or five arity form. The three arity forms
  # take the agent PID, an anonymous function to manipulate the state, and an optional timeout value which defaults to 5000 milliseconds.
  # The five arity forms take the agent PID, a module name, a function name, arguments,
  # and an optional timeout value just like the three arity version.

  def guessed?(coordinate) do
    Agent.get(coordinate, fn state -> state.guessed? end)
  end

  def island(coordinate) do
    Agent.get(coordinate, fn state -> state.in_island end)
  end

  def in_island?(coordinate) do
    case island(coordinate) do
      :none -> false
      _ -> true
    end
  end

  def hit?(coordinate) do
    in_island?(coordinate) && guessed?(coordinate)
  end
end
